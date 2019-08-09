# Server configuration
exports.serverPort = 8080

# Database configuration
username = 'redwire'
password = ''
host = 'localhost'
dbname = 'redwire'
port = '5432'

exports.dbConnString = "postgres://#{username}:#{password}@#{host}:#{port}/#{dbname}"

exports.testingDBConnString = "postgres://#{username}:#{password}@#{host}:#{port}/testing"

exports.droneDBConnString = "postgres://postgres:@localhost:5432/dronetest"

# Attached to signed response tokens using the 'issuer' field.
exports.serviceIssuerName = 'artdst'

# The number of rounds bcrypt uses to hash a password. Higher = more secure, but slower.
# Going below 10 is not secure enough, and above 13 much too slow.
exports.bcryptRounds = 11

# The password version should increment whenever a change is made to the way
# passwords are hashed. e.g. if a new hashing algorithm is introduced.
exports.passwordVersion = 0

# Path to the private key used to sign responses to consumers.
exports.privateKeyPath = './secrets/test_keys'

# The algorithm to use when signing data using jsonwebtoken.
exports.signingAlgorithm = [
  "HS256", "HS384", "HS512",
  "RS256", "RS384", "RS512",
  "ES256", "ES384", "ES512"
][5] # RSASSA using SHA-512 hash algorithm.

# The number of bytes to generate for auth tokens and service identifiers respectively.
exports.tokenLength = 64
exports.serviceIdLength = 32

# The path used to access to consumer dashboard for administration.
exports.consumerDashboardAddress = 'vHvad7NNUuIIllCIxuX31usFn2AR8xN0VcTTtDiHx5uGxpijOlh4ccorSZw'
