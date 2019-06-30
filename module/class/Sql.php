<?php

class Sql {

    public static $connect = null;

    public static function open_MySQL() {

        if (self::$connect) {
            return self::$connect;
        }

        mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);
        include $_SERVER["DOCUMENT_ROOT"] . "/config/config.db.php";

        $connectsql = new mysqli($host, $user, $pass, $dbname);

        if ($connectsql->connect_error) {
            header("Location:/module/dberr.php");
            die("");
        }

        $connectsql->set_charset($charset);

        return (self::$connect = $connectsql);
    }

    protected static function _refValues(&$arr) { // Changed $arr to reference for PHP v7.1.7 
        if (strnatcmp(phpversion(), '5.3') >= 0) { //Reference is required for PHP 5.3+
            $refs = array();
            foreach ($arr as $key => $value)
                $refs[$key] = &$arr[$key];
            return $refs;
        }
        return $arr;
    }

    protected static function _get_types($params) {
        $types = '';

        foreach ($params as $v) {
            if (is_int($v))
                $types .= 'i';
            else if (is_double($v))
                $types .= 'd';
            else if (is_string($v))
                $types .= 's';
            else
                $types .= 'b';
        }

        return $types;
    }

    protected static function _query($query_str, $params = array()) {
        $connect = self::open_MySQL();
        $stmt = $connect->prepare($query_str);

        if ($params) {
            call_user_func_array(array($stmt, 'bind_param'), array_merge(
                            array(self::_get_types($params)),
                            self::_refValues($params)
                    )
            );
        }

        return $stmt;
    }

    public static function query($query_str, $params = array()) {
        $stmt = self::_query($query_str, $params);

        $stmt->execute();

        $result = $stmt->get_result();

        if ($result !== false) {
            return $result; // SELECT query
        } else {
            return $stmt->affected_rows; // INSERT, UPDATE, DELETE query
        }
    }

    public static function select_WithCallBack($query_str, $params = array(), $func_callback = NULL, $offset = 0, $num = -1) {

        $result = self::query($query_str, $params);
        $length = !$result ? 0 : $result->num_rows;

        if ($func_callback && $length) {
            $result->data_seek($offset);
            if ($num == -1)
                $num = $length;
            $i = 1;
            while (($value = $result->fetch_array()) && ($i++ <= $num)) {
                if (!$func_callback($value))
                    break;
            }
        }
        return $length; // return number record of "SELECT" clause
    }

}

?>
