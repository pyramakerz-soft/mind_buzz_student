abstract class ParentImages {

  static const String mainPathOfSvg = 'assets/svg/parent_account/';
  static const String mainPathOfImages = 'assets/images/';
  static const String homeIcon = "${mainPathOfSvg}home_icon.svg";
  static const String calender = "${mainPathOfSvg}calender.svg";
  static const String calenderOutline = "${mainPathOfSvg}calender_outline.svg";
  static const String homeOutline = "${mainPathOfSvg}home_outline.svg";
  static const String notification = "${mainPathOfSvg}notification.svg";
  static const String notificationOutline = "${mainPathOfSvg}notification_outline.svg";
  static const String settings = "${mainPathOfSvg}settings.svg";
  static const String settingsOutline = "${mainPathOfSvg}settings_outline.svg";
  static const String defaultUserImage = "${mainPathOfSvg}default_user_image.png";
  static const String logout= "${mainPathOfSvg}logout.svg";
  static const String personalInfo= "${mainPathOfSvg}personal_info.svg";
  static const String aboutUS= "${mainPathOfSvg}about_us.svg";
  static const String editProfile= "${mainPathOfSvg}edit_profile.svg";
  static const String email = "${mainPathOfSvg}email_icon.svg";
  static const String phone = "${mainPathOfSvg}phone.svg";
  static const String lock = "${mainPathOfSvg}lock.svg";
  static const String dueIcon = "${mainPathOfSvg}due_icon.svg";
  static const String editImageIcon = "${mainPathOfSvg}edit_image_icon.svg";
  static const String buttonEllipse = "${mainPathOfSvg}button_ellipse.svg";

  static String notificationOutlineIcon(String count) => """
  <svg width="27" height="24" viewBox="0 0 27 24" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M16.859 18.2543L15.1541 12.1094C14.79 10.7949 13.9967 9.63996 12.9005 8.82838C11.8042 8.0168 10.468 7.59522 9.10451 7.63074C7.741 7.66625 6.42856 8.15682 5.37605 9.02437C4.32354 9.89192 3.59145 11.0866 3.29631 12.4182L1.97762 18.3527C1.91381 18.6402 1.91536 18.9384 1.98217 19.2252C2.04898 19.512 2.17933 19.7802 2.36361 20.0099C2.54789 20.2396 2.78139 20.425 3.04689 20.5525C3.3124 20.6799 3.60312 20.7461 3.89762 20.7461H6.26288C6.41338 21.4873 6.81549 22.1537 7.40108 22.6323C7.98666 23.1109 8.71971 23.3724 9.47601 23.3724C10.2323 23.3724 10.9654 23.1109 11.5509 22.6323C12.1365 22.1537 12.5386 21.4873 12.6891 20.7461H14.9646C15.2676 20.746 15.5665 20.6759 15.8379 20.5412C16.1094 20.4065 16.3461 20.211 16.5295 19.9698C16.7129 19.7286 16.8382 19.4483 16.8954 19.1507C16.9527 18.8532 16.9398 18.5464 16.859 18.2543ZM9.47601 22.0576C9.07059 22.0559 8.67559 21.929 8.34505 21.6943C8.01452 21.4595 7.76458 21.1284 7.62944 20.7461H11.3226C11.1874 21.1284 10.9375 21.4595 10.607 21.6943C10.2764 21.929 9.88143 22.0559 9.47601 22.0576ZM15.4859 19.1756C15.4247 19.2568 15.3454 19.3224 15.2543 19.3674C15.1632 19.4124 15.0629 19.4354 14.9613 19.4347H3.89762C3.79943 19.4347 3.7025 19.4126 3.61398 19.3701C3.52546 19.3276 3.44761 19.2658 3.38618 19.1892C3.32475 19.1126 3.28131 19.0232 3.25906 18.9275C3.2368 18.8319 3.23631 18.7325 3.25762 18.6366L4.57632 12.7022C4.80868 11.6571 5.38373 10.7196 6.21006 10.0389C7.0364 9.35809 8.06658 8.97309 9.13684 8.94506C10.2071 8.91702 11.256 9.24755 12.1169 9.88411C12.9777 10.5207 13.6011 11.4267 13.8878 12.4582L15.5928 18.6032C15.6206 18.7004 15.6254 18.8027 15.6069 18.902C15.5883 19.0014 15.5469 19.0951 15.4859 19.1756Z" fill="#707070"/>
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
