# result.gd
class_name Result

var _value
var _error
var _is_ok: bool

static func Ok(value):
    var result = Result.new()
    result._value = value
    result._is_ok = true
    return result

static func Err(error):
    var result = Result.new()
    result._error = error
    result._is_ok = false
    return result

func is_ok() -> bool:
    return _is_ok

func is_err() -> bool:
    return not _is_ok

func unwrap():
    if _is_ok:
        return _value
    push_error("Tried to unwrap an Err value")
    assert(false, "Unwrap failed")

func unwrap_or(default):
    return _value if _is_ok else default

func unwrap_err():
    if not _is_ok:
        return _error
    push_error("Tried to unwrap_err an Ok value")
    assert(false, "Unwrap_err failed")

func expect(message: String):
    if _is_ok:
        return _value
    push_error(message)
    assert(false, message)
