# error_type.gd
class_name ErrorType

# Standard error types based on Python's exception hierarchy
enum Code {
    NONE,
    # Base Exceptions
    EXCEPTION,              # Base class for all built-in exceptions
    TYPE_ERROR,            # Invalid operation for a data type
    VALUE_ERROR,           # Invalid value for an operation
    ATTRIBUTE_ERROR,       # Failed attribute reference
    NAME_ERROR,            # Local or global name not found
    
    # IO Related Errors
    IO_ERROR,              # Input/Output operation failure
    FILE_NOT_FOUND_ERROR,  # File or directory does not exist
    PERMISSION_ERROR,      # Operation not permitted
    
    # Arithmetic Errors
    ARITHMETIC_ERROR,      # Base for arithmetic errors
    ZERO_DIVISION_ERROR,   # Division or modulo by zero
    OVERFLOW_ERROR,        # Arithmetic operation exceeded limits
    
    # Index and Key Errors
    INDEX_ERROR,           # Sequence index out of range
    KEY_ERROR,            # Key not found in mapping
    
    # Runtime Errors
    RUNTIME_ERROR,         # General runtime error
    ASSERTION_ERROR,       # Assertion statement failed
    
    # Custom Error Types
    NETWORK_ERROR,         # Network-related errors
    DATABASE_ERROR,        # Database operation errors
    VALIDATION_ERROR,      # Data validation errors
    RESOURCE_ERROR,        # Resource loading/handling errors
}

# Core error properties
var code: int              # Error type code
var message: String        # Error message
var details: Dictionary    # Additional error details

# Initialize a new error instance
# @param error_code: The type of error from ErrorType.Code enum
# @param error_message: Custom error message (optional)
# @param error_details: Additional error information (optional)
func _init(error_code: int, error_message: String = "", error_details: Dictionary = {}):
    code = error_code
    message = error_message if error_message else _get_default_message(error_code)
    details = error_details

# Get the default message for a given error code
# @param error_code: The error code to get the message for
# @return: The default message string for the error code
func _get_default_message(error_code: int) -> String:
    match error_code:
        Code.EXCEPTION:
            return "An error occurred"
        Code.TYPE_ERROR:
            return "Invalid type operation"
        Code.VALUE_ERROR:
            return "Invalid value"
        Code.ATTRIBUTE_ERROR:
            return "Attribute reference failed"
        Code.NAME_ERROR:
            return "Name not found"
        Code.IO_ERROR:
            return "Input/Output operation failed"
        Code.FILE_NOT_FOUND_ERROR:
            return "File or directory not found"
        Code.PERMISSION_ERROR:
            return "Operation not permitted"
        Code.ARITHMETIC_ERROR:
            return "Arithmetic error occurred"
        Code.ZERO_DIVISION_ERROR:
            return "Division or modulo by zero"
        Code.OVERFLOW_ERROR:
            return "Arithmetic operation exceeded maximum limit"
        Code.INDEX_ERROR:
            return "Sequence index out of range"
        Code.KEY_ERROR:
            return "Key not found in mapping"
        Code.RUNTIME_ERROR:
            return "Runtime error occurred"
        Code.ASSERTION_ERROR:
            return "Assertion failed"
        Code.NETWORK_ERROR:
            return "Network operation failed"
        Code.DATABASE_ERROR:
            return "Database operation failed"
        Code.VALIDATION_ERROR:
            return "Validation failed"
        Code.RESOURCE_ERROR:
            return "Resource operation failed"
        _:
            return "Unknown error"

# Add additional details to the error
# @param additional_details: Dictionary of additional error information
# @return: Self for method chaining
func with_details(additional_details: Dictionary) -> ErrorType:
    details.merge(additional_details)
    return self

# Format the error into a human-readable string
# @return: Formatted error string including code, message, and details
func format_error() -> String:
    var error_str = "%s: %s" % [_get_error_name(code), message]
    if not details.is_empty():
        error_str += "\nDetails: " + str(details)
    return error_str

# Get the string name of the error code
# @param error_code: The error code to get the name for
# @return: String name of the error code
func _get_error_name(error_code: int) -> String:
    return Code.keys()[error_code]
