#  Notes
- Break out App, Network and Common into SPM packages.
- I don't like the name "Common".
- Talk to backend team that a variable could be send to limit the response to 50 post. Right now unnecessary data is retrieved and filtered on client.
- Make the tryMap, decode and map error reusable for network providers.
- Make posts mockable. Needed for unit tests and preview to not do network calls.
- Unit tests is missing.
