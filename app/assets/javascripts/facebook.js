// Additional JS functions here
window.fbAsyncInit = function() {
  FB.init({
    appId      : 400659536727696, // App ID
    status     : true, // check login status
    cookie     : true, // enable cookies to allow the server to access the session
    xfbml      : true  // parse XFBML
  });
};

// Load the SDK Asynchronously
(function(d){
   var js, id = 'facebook-jssdk', ref = d.getElementsByTagName('script')[0];
   if (d.getElementById(id)) {return;}
   js = d.createElement('script'); js.id = id; js.async = true;
   js.src = "//connect.facebook.net/en_US/all.js";
   ref.parentNode.insertBefore(js, ref);
}(document));

function fblogin() {
  FB.getLoginStatus(function(response) {
    if(response.status == "connected") {
      location.href =
        '/auth/facebook/callback?' +
        $.param({ signed_request: response.authResponse.signedRequest })
    } else {
     FB.login(function(response) {
      if (response.authResponse) {
          '/auth/facebook/callback?' +
          $.param({ signed_request: response.authResponse.signedRequest })
      }
     })
    }
  })
};
