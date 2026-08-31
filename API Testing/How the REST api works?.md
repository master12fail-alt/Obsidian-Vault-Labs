REST is Representational State Transfer . It is a architectural style, a set of conventions  that developers follow when building APIs over HTTP . 


**RESOURCES and ENDPOINTS**

The core concept in a RESTfull api is resources . so basically the resource is any object or a piece of data the api exposes, such as a user, a product, or an order. Each resource is identified by by a URL, referred to as an endpoint. For example, an e-commerce API might expose endpoints like v1/users, /v1/products . 

**HTTP Methods**
Each methods maps to a CRUD(Create, Read,Update Delete ) operations.
GET Read
POST Create
PUT Full Update      -Replaces an existing resource entirely. Omitted fields may be set to null or a default value.

PATCH Partial Update     - Modifies only the fields included in the request body. Everything else remains unchanged.

DELETE Delete

**Status code**
200,201,204,400,401,403,404,405,429,500

**Request and Response structure**
A typical API request consists of the HTTP method, the endpoint URL, headers(carrying the metadata such as authentication tokens and content type ), and optionally a body (carrying the data payload). The vast majority of modern APIs uses JSON(Javascript Object Notation ). as their data format .
**Authentication Mechanisms**
API keys
Bearer Tokens
JSON Web Tokens(JWTs)

**Broken authentication**
1. Lack of Rate Limiting on Login Endpoints
2. JWT (Jason Web Token)
3. Excessive Data explosure

**Mass assignment**
Mass assignment is the vulnerability that occurs when an API takes data from a client's request and applies objects without filtering which fields the client is permitted to set. t
Pu
