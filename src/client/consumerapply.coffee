[fullName, email, publicKey] = [
  "fullName", "email", "publicKey"
].map (e) -> document.getElementById e

apply = ->
  data = JSON.stringify
    fullName: fullName.value
    email: email.value
    certificate: publicKey.value
  console.log data
  xhr = new XMLHttpRequest
  xhr.open 'post', '/consumers/apply', true
  xhr.setRequestHeader 'Content-Type', 'application/json'
  xhr.setRequestHeader 'Content-Length', data.length
  xhr.onreadystatechange = ->
    if xhr.readyState is 4 and xhr.status is 200
      alert xhr.response
  xhr.send data
  return

(document.getElementById 'apply').addEventListener 'click', apply
