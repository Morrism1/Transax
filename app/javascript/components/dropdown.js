document.addEventListener("turbolinks:load", () => {
  const dropDownLinks = document.querySelectorAll(".js-nav .dropdown a");
  const dropDownMenu = document.querySelector(".dropdown-menu");

  function dropdown() {
    dropDownLinks.forEach(function(dropdown) {
      dropdown.addEventListener("click", (e) => {
        const dropdownTarget = dropdown.nextElementSibling;
        // console.log(e.target.nextElementSibling)

        if (e.target.nextElementSibling != null) {
          // Hide the dropdown
          dropdownTarget.classList.toggle("hidden");
          // Click outside of dropdown to also close
          hideOnClickOutside(dropdown);
          e.preventDefault();
        }
      })
    });
  }

  function hideOnClickOutside(element) {
    const outsideClickListener = function(event) {
      if (!element.contains(event.target)) {
        if (!!element && !!(element.offsetWidth || element.offsetHeight || element.getClientRects().length)) {
          element.nextElementSibling.classList.toggle('hidden');
          removeClickListener();
        }
      }
    }

    const removeClickListener = function() {
      document.removeEventListener("click", outsideClickListener);
    }

    document.addEventListener("click", outsideClickListener);
  }

  function init() {
    dropdown();
  }

  init();
});
