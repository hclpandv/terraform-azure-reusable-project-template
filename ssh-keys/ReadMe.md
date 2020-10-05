## Keep ida_rsa.pub file here

* Please copy pub key of the RSA key created for linux VM authentication.
* Below command can help you generate the same

```bash
# Generate RSA Key pair (pub key and pvt key)
ssh-keygen -b 2048 -t rsa -f ~/.ssh/id_rsa  -q -N ""
# Copy the public file
cp ~/.ssh/id_rsa .
```