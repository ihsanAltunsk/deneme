#Reporter : Reyyan Mert
#US Priority : MEDIUM
  Feature: As an administrator, I want to access the details of the Refund&Reason with the specified ID number via the API connection.

    Scenario Outline: When a GET request body containing valid authorization information and the refund&reason ID to access
    detailed information is sent to the /api/refundReasonDetails endpoint, the returned status code should be 200 and the message
    information in the response body should be verified as "success".

      * The api user constructs the base url with the "admin" token.
      * The api user sets "api/refundReasonDetails" path parameters
      * The api user prepares a GETBODY request containing the id = 1 and records the response.
      * The api user verifies that the status code is 200
      * The api user verifies that the message information in the response body is "success"
      * The api user verifies the content of the data <id>, "<reason>","<created_at>","<updated_at>" in the response body.

    Examples:
    |id   |  reason         |  created_at               | updated_at                |
    | 1   | Product mismatch|2024-01-22T23:19:00.000000Z|2024-01-22T23:19:00.000000Z|

      Scenario Outline:When a GET request containing valid authorization information and an incorrect
      (non-existent in the system) refund&reason ID is sent to the /api/refundReasonDetails endpoint, the returned status code
      should be 404, and the message information should be validated as "refund Reason  not found".

        * The api user constructs the base url with the "admin" token.
        * The api user sets "api/refundReasonDetails " path parameters
        * The api user prepares a GETBODY request containing the id = <id> and records the response.
        * The api user verifies that the status code is 401
        * The api user verifies that the message information in the response body is "Unauthenticated."

        Examples:
          | id |
          | 45 |

        Scenario Outline: When a GET request body containing invalid authorization information and the refund&reason ID to
        access detailed information is sent to the /api/refundReasonDetails endpoint, the returned status code should be 401,
        and the message information in the response body should be validated as "Unauthenticated."

          * The api user constructs the base url with the "invalid" token.
          * The api user sets "api/refundReasonDetails " path parameters
          *  The api user prepares a GETBODY request containing the id = <id> and records the response.
          * The api user verifies that the status code is 404
          * The api user verifies that the message information in the response body is "user not found"

          Examples:
            | id |
            | 1  |