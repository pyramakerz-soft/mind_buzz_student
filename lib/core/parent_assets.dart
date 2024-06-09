abstract class ParentImages {
  static const String mainPathOfSvg = 'assets/svg/parent_account/';
  static const String mainPathOfImages = 'assets/images/';
  static const String homeIcon = "${mainPathOfSvg}home_icon.svg";
  static const String calender = "${mainPathOfSvg}calender.svg";
  static const String calenderOutline = "${mainPathOfSvg}calender_outline.svg";
  static const String homeOutline = "${mainPathOfSvg}home_outline.svg";
  static const String notification = "${mainPathOfSvg}notification.svg";
  static const String notificationOutline =
      "${mainPathOfSvg}notification_outline.svg";
  static const String settings = "${mainPathOfSvg}settings.svg";
  static const String settingsOutline = "${mainPathOfSvg}settings_outline.svg";
  static const String defaultUserImage =
      "${mainPathOfSvg}default_user_image.png";
  static const String logout = "${mainPathOfSvg}logout.svg";
  static const String personalInfo = "${mainPathOfSvg}personal_info.svg";
  static const String aboutUS = "${mainPathOfSvg}about_us.svg";
  static const String editProfile = "${mainPathOfSvg}edit_profile.svg";
  static const String email = "${mainPathOfSvg}email_icon.svg";
  static const String phone = "${mainPathOfSvg}phone.svg";
  static const String lock = "${mainPathOfSvg}lock.svg";
  static const String dueIcon = "${mainPathOfSvg}due_icon.svg";
  static const String editImageIcon = "${mainPathOfSvg}edit_image_icon.svg";
  static const String buttonEllipse = "${mainPathOfSvg}button_ellipse.svg";

  static String notificationOutlineIcon(String count) => """
  <svg width="27" height="23" viewBox="0 0 27 24" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M3.20527 17.0406H17.6646C18.1096 17.0406 18.548 16.9335 18.9428 16.7282C19.3377 16.5229 19.6772 16.2255 19.9328 15.8612C20.1884 15.4969 20.3524 15.0764 20.4111 14.6353C20.4698 14.1942 20.4214 13.7454 20.2699 13.327L17.6359 6.04469C17.1861 4.42634 16.2185 2.99988 14.8812 1.98348C13.5439 0.967085 11.9105 0.4167 10.2308 0.416504C8.48225 0.416477 6.78597 1.01274 5.42202 2.10686C4.05807 3.20097 3.10801 4.72751 2.72871 6.43443L0.558344 13.4535C0.43056 13.8679 0.401833 14.3065 0.474474 14.734C0.547116 15.1616 0.719097 15.5661 0.976581 15.915C1.23406 16.264 1.56986 16.5476 1.95695 16.7431C2.34404 16.9386 2.77162 17.0405 3.20527 17.0406Z" fill="white"/>
<path d="M6.00547 18.8877C6.21745 19.9316 6.78379 20.8701 7.60854 21.5442C8.43329 22.2183 9.46573 22.5866 10.5309 22.5866C11.5961 22.5866 12.6286 22.2183 13.4533 21.5442C14.2781 20.8701 14.8444 19.9316 15.0564 18.8877H6.00547Z" fill="white"/>
<circle cx="16.9838" cy="9.29029" r="8.51613" fill="white" stroke="#D14663" stroke-width="1.54839"/>
    <text x="13" y="14" fill="#D14663" font-size="14">${count}</text>
</svg>
""";

  static String notificationIcon(String count) => """
<svg width="27" height="24" viewBox="0 0 27 24" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M16.859 18.2543L15.1541 12.1094C14.79 10.7949 13.9967 9.63996 12.9005 8.82838C11.8043 8.0168 10.468 7.59522 9.10454 7.63074C7.74103 7.66625 6.42858 8.15682 5.37607 9.02437C4.32356 9.89192 3.59148 11.0866 3.29633 12.4182L1.97764 18.3527C1.91383 18.6402 1.91539 18.9384 1.98219 19.2252C2.049 19.512 2.17935 19.7802 2.36363 20.0099C2.54791 20.2396 2.78141 20.425 3.04692 20.5525C3.31242 20.6799 3.60315 20.7461 3.89765 20.7461H6.2629C6.41341 21.4873 6.81552 22.1537 7.4011 22.6323C7.98668 23.1109 8.71973 23.3724 9.47603 23.3724C10.2323 23.3724 10.9654 23.1109 11.551 22.6323C12.1365 22.1537 12.5387 21.4873 12.6892 20.7461H14.9646C15.2676 20.746 15.5665 20.6759 15.838 20.5412C16.1094 20.4065 16.3461 20.211 16.5295 19.9698C16.713 19.7286 16.8382 19.4483 16.8955 19.1507C16.9527 18.8532 16.9398 18.5464 16.859 18.2543ZM9.47603 22.0576C9.07061 22.0559 8.67562 21.929 8.34508 21.6943C8.01454 21.4595 7.7646 21.1284 7.62947 20.7461H11.3226C11.1875 21.1284 10.9375 21.4595 10.607 21.6943C10.2764 21.929 9.88145 22.0559 9.47603 22.0576ZM15.4859 19.1756C15.4247 19.2568 15.3454 19.3224 15.2543 19.3674C15.1632 19.4124 15.0629 19.4354 14.9613 19.4347H3.89765C3.79946 19.4347 3.70252 19.4126 3.614 19.3701C3.52548 19.3276 3.44764 19.2658 3.3862 19.1892C3.32477 19.1126 3.28133 19.0232 3.25908 18.9275C3.23683 18.8319 3.23634 18.7325 3.25764 18.6366L4.57634 12.7022C4.8087 11.6571 5.38376 10.7196 6.21009 10.0389C7.03642 9.35809 8.0666 8.97309 9.13687 8.94506C10.2071 8.91702 11.2561 9.24755 12.1169 9.88411C12.9777 10.5207 13.6011 11.4267 13.8879 12.4582L15.5928 18.6032C15.6206 18.7004 15.6255 18.8027 15.6069 18.902C15.5884 19.0014 15.5469 19.0951 15.4859 19.1756Z" fill="#707070"/>
<circle cx="16.9838" cy="9.29029" r="8.51613" fill="white" stroke="#D14663" stroke-width="1.54839"/>
    <text x="13" y="14" fill="#D14663" font-size="14">${count}</text>
</svg>
""";

  static const String timers = "${mainPathOfSvg}timers.svg";
  static const String imageAssignment = "${mainPathOfImages}assignment.png";
  static const String imageReports = "${mainPathOfImages}reports.png";
  static const String imageFilter = "${mainPathOfImages}filter.png";
  static const String imageDate = "${mainPathOfImages}calendar.png";
}
