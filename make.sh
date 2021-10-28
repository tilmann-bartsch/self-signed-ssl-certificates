# Create simple setup

# Create a certificate authority
openssl req -new -x509 -days 3650 -extensions v3_ca -keyout ca.key -out ca.crt \
    -passout pass:foobar \
    -subj "/CN=custom_certificate_authority"
    
# Generate server key
openssl genrsa -out server.key 2048   

# Generate certificate signing request
openssl req -out server.csr -key server.key -new -subj "/CN=localhost"

# Sign certificate
openssl x509 -req -in server.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out server.crt -days 3650 -passin pass:foobar
