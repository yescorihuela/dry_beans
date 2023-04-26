# README

#### Stack used here:
1. Rails 7.0.4.3
2. Ruby 3.1.2p20
3. PostgreSQL 14

#### Clone and pull all the repo:**
```bash
git clone https://github.com/yescorihuela/dry_beans.git
```


#### If you want to run the tests, prompt in the root of the project:
```bash
$ rspec
```

The routes are described as following below:

|                   **Endpoint**                  | **HTTP Method** |            **Example**            |                                                                                             **Comments**                                                                                            |
|:-----------------------------------------------:|:---------------:|:---------------------------------:|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------:|
|                /api/v1/routes/:id               |       GET       | /api/v1/routes/1                  | It allows recover all the info related with the route, its trips and all the pickups/deliveries done                                                                                                |
| /api/v1/routes                                  |       POST      | /api/v1/routes                    | It allows create a new route with the json payload  ```{ "name": "hola", "active": true }```                                                                                                        |
| /api/v1/routes/:route_id/trips                  |       POST      | /api/v1/routes/1/trips            | It allows create a new trip, it doesn't need json payload                                                                                                                                           |
| /api/v1/routes/:route_id/trips/:trip_id/actions |       POST      | /api/v1/routes/1/trips/1/actions  | It allows create a new action with the following json payload:  ``` { 		"current_action": { 		"comments": "", 		"address": "monjitas", 		"latitude": 0.0, 		"longitude": 0.0, 		"operation": "pick_up" 	} }  ``` |
| /api/v1/routes/:route_id/trips/:id/complete     |      PATCH      | /api/v1/routes/1/trips/1/complete | It doesn't need json payload                                                                                                                                                                        |

### To be defined?

- Dockerization
- Add pagination to json results
- Add more tests