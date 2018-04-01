document.addEventListener('DOMContentLoaded', function () {

  var viewmoreP = document.querySelector('#view-more'),
      isLoading = false,
      lastLoadTime = null; //when loaded last page

  var scrollingTime = function() {
    return lastLoadTime == null || new Date() - lastLoadTime > 1000
  }

  var reachedBottom = function() {
    return (window.innerHeight + window.scrollY) >= document.body.offsetHeight
  }

  var nextPage = function() {
      console.log("scrolled down")
      url = viewmoreP.querySelector('a').href

      viewmoreP.className='loading'
      isLoading = true
      lastLoadTime = new Date()

      $.ajax({
        url: url,
        method: 'GET',
        dataType: 'script'
      }).done(
        function(responseData) {
          viewmoreP.className = ''
          isLoading = false
          lastLoadTime = new Date();
        }
      )

  }

  document.addEventListener("scroll", function (event) {
    // Detect if scrolled to bottom of the page
    if ( reachedBottom() && scrollingTime()) {
      nextPage()
    }
  })

  viewmoreP.querySelector('a').addEventListener('click', function(e) {
    nextPage();
    e.preventDefault()
  });

})
