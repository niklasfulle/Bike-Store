const urlParams = new URLSearchParams(window.location.search);

/**
 * reveals the go to top or bottom buttons
 */
window.onscroll = function () {
  if (document.getElementById("topDownButtons") != null) {
    scrollFunction();
  }
};

function scrollFunction() {
  if (document.body.scrollTop > 200 || document.documentElement.scrollTop
      > 200) {
    document.getElementById("topDownButtons").style.display = "block";
  } else {
    document.getElementById("topDownButtons").style.display = "none";
  }
}

/**
 * goes to the top of the website
 */
function scrollToTheTop() {
  document.body.scrollTop = 0;
  document.documentElement.scrollTop = 0;
}

/**
 * goes to the bottom of the website
 */
function scrollToTheBottom() {
  document.body.scrollTop = document.body.scrollHeight;
  document.documentElement.scrollTop = document.body.scrollHeight;
}

function openCrudView(id) {
  scrollToTheTop();

  let ids = id.split("_");
  let view = "";

  view = view + ids[1];

  if (ids[2] != null) {
    view = view + "_" + ids[2];
  }

  urlParams.set("view", view);

  window.location.search = urlParams;
}

function closeCrudView(id) {
  let element = document.getElementById(id);
  element.classList.remove("flex");

  urlParams.delete("view");

  window.location.search = urlParams;
}

function selectElement(selector) {
  const element = document.getElementById(selector);
  if (element) {
    return element;
  }
}

/**
 * sets the value of the entity in the inputfield,
 * so that's can be edited
 *
 * @param cssClass the css class of the form
 * @param id the id of the inputfield
 * @param value value that gets set in the inputfield
 */
function setValueById(cssClass, id, value) {
  let formId = document.getElementsByClassName(cssClass)[0].id;
  let inputId = formId + ":" + id;
  selectElement(inputId).value = value;
}

function setLimit() {
  let limit;
  if (document.getElementById("objectLimit") != null) {
    limit = document.getElementById("objectLimit").value;
  }

  urlParams.set("limit", limit);

  window.location.search = urlParams;
}

function setOrder(i) {
  let orderby;

  if (document.getElementById("objectSortierung" + i) != null) {
    orderby = document.getElementById("objectSortierung" + i).value;
  }

  if (orderby !== "") {
    urlParams.set("order", orderby);
  } else {
    urlParams.delete("order");
  }

  window.location.search = urlParams;
}

function setSelectFields() {
  let selectLimit, selectOrder, selectSearch;
  const limit = urlParams.get("limit");
  const order = urlParams.get("order");
  const search = urlParams.get("search");
  const view = urlParams.get("view");

  if (document.getElementById("objectLimit") != null) {
    selectLimit = document.getElementById("objectLimit");
  }

  for (let i = 1; i < 9; i++) {
    if (document.getElementById("objectSortierung" + i) != null) {
      selectOrder = document.getElementById("objectSortierung" + i);
    }
  }

  if (document.getElementById("searchInput") != null) {
    selectSearch = document.getElementById("searchInput");
  }

  if (view != null) {
    let href = window.location.href.split("/");

    let element = document.getElementById(href[5] + "_" + view);
    element.classList.add("flex");
  }

  if (limit != null) {
    selectLimit.value = limit;
  }

  if (order != null) {
    selectOrder.value = order;
  }

  if (search != null) {
    selectSearch.value = search;
  }
}

function selectSearch() {
  if (document.getElementById("searchInput") != null) {
    const search = document.getElementById("searchInput").value;

    if (search !== "") {
      urlParams.set("search", search);
    } else {
      urlParams.delete("search");
    }

    window.location.search = urlParams;
  }
}

function toggleNav() {
  let navLinks = document.getElementById("nav-links");

  if (!navLinks.classList.contains("block")) {
    navLinks.classList.add("block");
  } else {
    navLinks.classList.remove("block");
  }
}

function revealOptionsHidden() {
  let options = document.getElementById("options");
  let optionsImg = document.getElementById("optionsImg");

  if (!options.classList.contains("flex")) {
    options.classList.add("flex");
    optionsImg.classList.add("rotate180");
  } else {
    options.classList.remove("flex");
    optionsImg.classList.remove("rotate180");
  }
}

function checkIfEmpty(className, name) {
  let input = document.getElementsByClassName(className)[0];
  let button = document.getElementsByClassName("saveButtonForm")[0];
  console.log(input.value);
  if (input.value === "") {
    document.getElementById("errorMessageP").innerText = name
        + " darf nicht leer sein.";
    button.disabled = true;
    document.getElementById("errorMessageP").style.display = "block";
  } else {
    button.disabled = false;
    document.getElementById("errorMessageP").style.display = "none";
  }
}
