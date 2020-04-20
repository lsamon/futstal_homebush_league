// import javascript
import "bootstrap"
import "@fortawesome/fontawesome-free"
import "aurelia-bootstrap-datetimepicker/node_modules/eonasdan-bootstrap-datetimepicker"
import "moment-timezone"
import "datatables.net"
import 'datatables.net-bs4'
import "datatables.net-bs4/css/dataTables.bootstrap4.min.css"
import 'aurelia-bootstrap-datetimepicker/dist/amd/bootstrap-datetimepicker-bs4.css'

/*!
    * Start Bootstrap - SB Admin v6.0.0 (https://startbootstrap.com/templates/sb-admin)
    * Copyright 2013-2020 Start Bootstrap
    * Licensed under MIT (https://github.com/BlackrockDigital/startbootstrap-sb-admin/blob/master/LICENSE)
    */
    
(function($) {
  "use strict";

  // Add active state to sidbar nav links
  var path = window.location.href; // because the 'href' property of the DOM element is the absolute path
  $("#layoutSidenav_nav .sb-sidenav a.nav-link").each(function() {
    if (this.href === path) {
      $(this).addClass("active");
    }
  });

  // Toggle the side navigation
  $("#sidebarToggle").on("click", function(e) {
    e.preventDefault();
    $("body").toggleClass("sb-sidenav-toggled");
  });

  // Datatable settings
  $('#dataTable').DataTable();

  // DateTime setting
  $("#datetimepicker").datetimepicker({
    format: 'yyyy-mm-dd hh:ii'
  });
})(jQuery);
