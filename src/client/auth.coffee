[username, email, password, referrer] = [
  "username", "email", "password", "referrer"
].map (id) -> document.getElementById id

register = (evt) ->
  data = JSON.stringify
    username: username.value
    email: email.value,
    password: password.value
    referrer: referrer.value
  xhr = new XMLHttpRequest
  xhr.open 'post', '/auth/register', true
  xhr.setRequestHeader 'Content-Type', 'application/json'
  xhr.setRequestHeader 'Content-Length', data.length
  xhr.onreadystatechange = ->
    if xhr.readyState is 4 and xhr.status is 200
      alert xhr.response
  console.log data
  xhr.send data
  console.log 'Sent XHR'
  return

(document.getElementById "sendbutton").addEventListener 'click', ->
  alert 'Making registration request'
  register()
  return
