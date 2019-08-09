(function() {
  var apply, email, fullName, publicKey, _ref;

  _ref = ["fullName", "email", "publicKey"].map(function(e) {
    return document.getElementById(e);
  }), fullName = _ref[0], email = _ref[1], publicKey = _ref[2];

  apply = function() {
    var data, xhr;
    data = JSON.stringify({
      fullName: fullName.value,
      email: email.value,
      certificate: publicKey.value
    });
    console.log(data);
    xhr = new XMLHttpRequest;
    xhr.open('post', '/consumers/apply', true);
    xhr.setRequestHeader('Content-Type', 'application/json');
    xhr.setRequestHeader('Content-Length', data.length);
    xhr.onreadystatechange = function() {
      if (xhr.readyState === 4 && xhr.status === 200) {
        return alert(xhr.response);
      }
    };
    xhr.send(data);
  };

  (document.getElementById('apply')).addEventListener('click', apply);

}).call(this);
