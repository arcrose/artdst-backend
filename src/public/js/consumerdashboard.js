(function() {
  var cb, checkboxes, key, toggleAccess, _i, _len;

  key = (function(url) {
    return url[url.length - 1];
  })(document.URL.split('/'));

  toggleAccess = function(checkbox) {
    return function() {
      var data, xhr;
      data = JSON.stringify({
        allowed: checkbox.checked,
        key: key
      });
      console.log(data);
      xhr = new XMLHttpRequest;
      xhr.open('post', "/consumers/" + checkbox.value + "/setaccess", true);
      xhr.setRequestHeader('Content-Type', 'application/json');
      xhr.setRequestHeader('Content-Length', data.length);
      xhr.onreadystatechange = function() {
        if (xhr.readyState === 4 && xhr.status === 200) {
          return alert(xhr.response);
        }
      };
      xhr.send(data);
    };
  };

  checkboxes = document.getElementsByClassName('allowbox');

  for (_i = 0, _len = checkboxes.length; _i < _len; _i++) {
    cb = checkboxes[_i];
    cb.addEventListener('click', toggleAccess(cb));
  }

}).call(this);
