function define_library() {
  var UserAccess = {};
  var url;
  var dateTime;
  var page;
  var infos_hash;
  var infos_array;
  var updated_infos;

  UserAccess.set = function(page_name) {
    // Access infos
    url = window.location.protocol + "//" + window.location.host + "/" + window.location.pathname;
    dateTime = loadDatetime;
    page = page_name;

    infos_hash = { token: userId.toString(), url: url, dateTime: dateTime, page: page };
    infos_array = jQuery.parseJSON(localStorage.getItem(userId.toString()));

    if (infos_array) {
      infos_array.push(infos_hash);
      updated_infos = infos_array;
    } else {
      updated_infos = [infos_hash];
    }

    localStorage.setItem(userId.toString(), JSON.stringify(updated_infos));
  }

  UserAccess.get = function(form) {
    var infos = jQuery.parseJSON(localStorage.getItem(userId.toString()));
    var count = 0;

    infos.forEach(function(hash) {
      var name = 'input_' + count + '_token';
      var input_token = document.createElement('input');
      input_token.type = 'hidden';
      input_token.name = "user[pages][" + name + "]";
      input_token.value = hash.token;

      var name = 'input_' + count + '_url';
      var input_url = document.createElement('input');
      input_url.type = 'hidden';
      input_url.name = "user[pages][" + name + "]";
      input_url.value = hash.url;

      var name = 'input_' + count + '_dateTime';
      var input_dateTime = document.createElement('input');
      input_dateTime.type = 'hidden';
      input_dateTime.name = "user[pages][" + name + "]";
      input_dateTime.value = hash.dateTime;

      var name = 'input_' + count + '_page';
      var input_page = document.createElement('input');
      input_page.type = 'hidden';
      input_page.name = "user[pages][" + name + "]";
      input_page.value = hash.page;

      form.appendChild(input_token);
      form.appendChild(input_url);
      form.appendChild(input_dateTime);
      form.appendChild(input_page);

      count += 1;
    });
  }

  return UserAccess;
}