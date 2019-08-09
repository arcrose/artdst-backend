key = do (url = document.URL.split '/') -> url[url.length - 1]

toggleAccess = (checkbox) ->->
  data = JSON.stringify allowed: checkbox.checked, key: key
  console.log data
  xhr = new XMLHttpRequest
  xhr.open 'post', "/consumers/#{checkbox.value}/setaccess", true
  xhr.setRequestHeader 'Content-Type', 'application/json'
  xhr.setRequestHeader 'Content-Length', data.length
  xhr.onreadystatechange = ->
    if xhr.readyState is 4 and xhr.status is 200
      alert xhr.response
  xhr.send data
  return

checkboxes = document.getElementsByClassName 'allowbox'

for cb in checkboxes
  cb.addEventListener 'click', toggleAccess cb
