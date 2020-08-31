## Trailblazer & Grape API
Models
- USER - (like as admin)
- CLIENT
- PROJECT
- PERMISSION - permission stores in database records, you will find some of them in seeds.rb, so run `rails db:seed`

**ENV VARIABLES**
```gem install dotenv-rails```
create `.env` in *root folder* and set your local variables:
```
DB_USERNAME=
DB_PASSWORD=
AUTHORIZE_API_PATH=http://localhost:3000/api/v1/microservice/authorization
ISSUER=RedlineSolutions
AUTH_SECRET=afsgsagsfdgds
PAYLOAD_USER_KEY=user
```
## API Resources
*Implemented all CRUD functionality*
```
POST  /api/v1/users - Register new User
POST  /api/v1/sign_in - Sign in User

GET	 /api/v1/projects?page=number&per_page=number - List all projects
GET	 /api/v1/projects/:id - Return specific project
POST /api/v1/projects - Create Project
PUT	 /api/v1/projects/:id - Update project
DELETE  /api/v1/projects/:id - Destroy project
```
*Postman Collections via link* `https://www.getpostman.com/collections/30c466a44ce2a9fb061d`

### Trailblazer macroses

| Macros | Description |
| --- | --- |
| ```Macro::Permission::ServiceCall``` | Provides to call mocked microservice for permissions
| ```Macro::Paginate``` | Provides to paginate models |
| ```Macro::GenerateToken``` | Provides to generate JWT token 
| ```Macro::Rollback``` | Provides raise ActiveRecord Rollback if fails |
| ```Macro::ModelDestroy``` | Provides to destroy model |
## User

*Sign_up*
```
POST	/api/v1/users
```
**example:**
```
{
    "email": "user@example.com",
    "password": "password",
    "password_confirmation": "password_confirmation"
}
```

**response:** `200`
In Headers: Auth-Token: ```eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyIjoxLCJpc3MiOiJSZWRsaW5lU29sdXRpb25zIiwiZXhwIjox....```
```
{
    "data": {
        "id": "1",
        "type": "user",
        "attributes": {
            "email": "super_admin@example.com"
        }
    }
}

```
**response:** `422` 

*Sign_in*
```
POST /api/v1/sign_in
```
**example:**
```
{
    "email": "user@example.com",
    "password": "password"
}
```
**response:** `200`
In Headers: Auth-Token: ```eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyIjoxLCJpc3MiOiJSZWRsaW5lU29sdXRpb25zIiwiZXhwIjox....```
```
{
    "data": {
        "id": "1",
        "type": "user",
        "attributes": {
            "email": "super_admin@example.com"
        }
    }
}
```
**response:** `401`
```
{
    "message": "Invalid Credentials"
}
```
## Project
*List all projects*
In Headers: Auth-Token ```Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyIjoxLCJpc3MiOiJSZWRsaW5lU29sdXRpb25zIiwiZXhwIjox....```
```
GET	/api/v1/projects?page=1&per_page=10
```
**response:**
```
{
    "data": [
        {
            "id": "1",
            "type": "project",
            "attributes": {
                "name": "MVP"
            },
            "relationships": {
                "client": {
                    "data": {
                        "id": "1",
                        "type": "client"
                    }
                }
            }
        }
    ]
}
```
**response:** `401`

*Return specific project*
In Headers: Auth-Token ```Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyIjoxLCJpc3MiOiJSZWRsaW5lU29sdXRpb25zIiwiZXhwIjox....```
```
GET	/api/v1/projects/1
```
**response:**
```
{
    "data": [
        {
            "id": "1",
            "type": "project",
            "attributes": {
                "name": "MVP"
            },
            "relationships": {
                "client": {
                    "data": {
                        "id": "1",
                        "type": "client"
                    }
                }
            }
        }
    ]
}
```
**response:** `401`
```
{
    "message": "Permission Forbidden"/"Project not Found"
}
```
*Create Project*
```
POST /api/v1/projects
```
**example:**
for new client
```
{
    "name": "Nike new mobile app",
    "client": {
        "name": "James Johnson"
    }
}
```
or for existing client
```
{
    "name": "Nike new mobile app",
    "client": {
        "id": "1"
    }
}
```
**response:** `200`
```
{
    "data": {
        "id": "2",
        "type": "project",
        "attributes": {
            "name": "Nike new mobile app"
        },
        "relationships": {
            "client": {
                "data": {
                    "id": "2",
                    "type": "client"
                }
            }
        }
    }
}
```
**response:** `401`
```
{
    "message": "Permission Forbidden"
}
```

*Update project*
In Headers: Auth-Token ```Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyIjoxLCJpc3MiOiJSZWRsaW5lU29sdXRpb25zIiwiZXhwIjox....```
```
PUT	/api/v1/projects/3
```
**example:**
```
{
    "name": "Adidas Project",
    "client": {}
}
```
**response:** `200`
```
{
    "data": {
        "id": "3",
        "type": "project",
        "attributes": {
            "name": "Adidas Project"
        },
        "relationships": {
            "client": {
                "data": {
                    "id": "3",
                    "type": "client"
                }
            }
        }
    }
}
```
**response:** `401`
```
{
    "message": "Permission Forbidden"
}
```
*Destroy Project*
```
DELETE	/api/v1/projects/3
```
**response:** `204`
```
```
**response:** `404`
```
{
    "message": "Project Not Found"
}
```
**response:** `401`
```
{
    "message": "Permission Forbidden"
}
```
## Client errors
Sending invalid JSON or paremeters will result in a 400 Bad Request response.

Sending invalid fields will result in a 422 Unprocessable Entity response.

422 Unprocessable Entity