(function() {
  var email, password, referrer, register, username, _ref;

  _ref = ["username", "email", "password", "referrer"].map(function(id) {
    return document.getElementById(id);
  }), username = _ref[0], email = _ref[1], password = _ref[2], referrer = _ref[3];

  register = function(evt) {
    var data, xhr;
    data = JSON.stringify({
      username: username.value,
      email: email.value,
      password: password.value,
      referrer: referrer.value
    });
    xhr = new XMLHttpRequest;
    xhr.open('post', '/auth/register', true);
    xhr.setRequestHeader('Content-Type', 'application/json');
    xhr.setRequestHeader('Content-Length', data.length);
    xhr.onreadystatechange = function() {
      if (xhr.readyState === 4 && xhr.status === 200) {
        return alert(xhr.response);
      }
    };
    console.log(data);
    xhr.send(data);
    console.log('Sent XHR');
  };

  (document.getElementById("sendbutton")).addEventListener('click', function() {
    alert('Making registration request');
    register();
  });

}).call(this);
