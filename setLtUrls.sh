#!/bin/bash
lt --port 8080 | sed 's/your url is: //g' > logiteca1
lt --port 8081 | sed 's/your url is: //g' > logiteca2

