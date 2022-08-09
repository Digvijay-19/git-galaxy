package policy
enforce[decision] {
  #title: user is alice
  input.subject == "alice"
  decision := {
    "allowed": true,
    "entz": set(),
    "message": "user is alice"
  }
}

enforce[decision] {
  #title: user is bob
  input.subject == "bob"
  input.action == "GET"
  decision := {
    "allowed": true,
    "entz": set(),
    "message": "user is bob"
  }
}
# By default, requests are denied and have no entitlements
#
# Rules that allow a request should be of the form:
# enforce[decision] {
#     input.subject == "user@acme.org"
#     decision := {
#         "allowed": true,
#         "message": "optional message: why request was allowed",
#         "entz": {"optional set", "contains any type of object"}
#     }
# }
#
# Rules that deny a request should be of the form:
# enforce[decision] {
#     input.context.location == "Mars"
#     decision := {
#         "denied": true,
#         "message": "optional message: why request was denied",
#         "entz": {"optional set"}
#     }
# }
#
# If a request is denied by any rule, then the request is denied
