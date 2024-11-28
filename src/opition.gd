# option.gd
class_name Option

var _value
var _has_value: bool

static func Some(value):
    var option = Option.new()
    option._value = value
    option._has_value = true
    return option

static func None():
    var option = Option.new()
    option._has_value = false
    return option

func is_some() -> bool:
    return _has_value

func is_none() -> bool:
    return not _has_value

func unwrap():
    if _has_value:
        return _value
    push_error("Tried to unwrap None")
    assert(false, "Unwrap failed")

func unwrap_or(default):
    return _value if _has_value else default
