/*
document.addEventListener('DOMContentLoaded', function () {

  var viewmoreP = document.querySelector('#view-more'),
      isLoading = false;

  var nextPage = function() {
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

  }

  document.addEventListener("scroll", function (event) {
    // Detect if scrolled to bottom of the page
    if ((window.innerHeight + window.scrollY) >= document.body.offsetHeight){
      nextPage()
    }
  })

  viewmoreP.querySelector('a').addEventListener('click', function(e) {
    nextPage();
    e.preventDefault()
  });

})
