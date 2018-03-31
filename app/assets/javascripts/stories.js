document.addEventListener('DOMContentLoaded', function () {

  var contentDiv = document.querySelector('#content'),
      viewmoreP = document.querySelector('#view-more'),
      lastDiv = document.querySelector('div:last-child'),
      lastDivOffset = lastDiv.offsetTop + lastDiv.clientHeight,
      pageOffset =  window.pageYOffset + window.innerHeight,
      isLoading = false;

  var nextPage = function() {
    if (pageOffset > lastDivOffset - 20) {

      console.log("scrolled down")
      url = viewmoreP.querySelector('a').href

      viewmoreP.className='loading'
      isLoading = true

      $.ajax({
        url: url,
        method: 'GET',
        dataType: 'script'
      }).done(
        function(responseData) {
          viewmoreP.className = ''
          isLoading = false;
        }
      )
    // var newDiv = document.createElement("div");
    // newDiv.innerHTML = "my awesome new div";
    // document.getElementById("scroll-content").appendChild(newDiv);
    // nextPage();
    }
  }

  document.addEventListener("scroll", function (event) {
      nextPage();
  })

})
