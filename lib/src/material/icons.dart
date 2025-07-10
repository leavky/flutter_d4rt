import 'package:d4rt/d4rt.dart';
import 'package:flutter/material.dart';

/// Returns the BridgedClassDefinition for the Flutter Icons class.
BridgedClassDefinition getIconsBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: Icons,
    name: 'Icons',
    staticGetters: {
      // Navigation icons
      'add': (visitor) => Icons.add,
      'remove': (visitor) => Icons.remove,
      'close': (visitor) => Icons.close,
      'menu': (visitor) => Icons.menu,
      'home': (visitor) => Icons.home,
      'dark_mode': (visitor) => Icons.dark_mode,
      'light_mode': (visitor) => Icons.light_mode,
      'auto_mode': (visitor) => Icons.auto_mode,
      'arrow_back': (visitor) => Icons.arrow_back,
      'arrow_forward': (visitor) => Icons.arrow_forward,
      'arrow_upward': (visitor) => Icons.arrow_upward,
      'arrow_downward': (visitor) => Icons.arrow_downward,
      'arrow_left': (visitor) => Icons.arrow_left,
      'arrow_right': (visitor) => Icons.arrow_right,
      'keyboard_arrow_up': (visitor) => Icons.keyboard_arrow_up,
      'keyboard_arrow_down': (visitor) => Icons.keyboard_arrow_down,
      'keyboard_arrow_left': (visitor) => Icons.keyboard_arrow_left,
      'keyboard_arrow_right': (visitor) => Icons.keyboard_arrow_right,
      'expand_less': (visitor) => Icons.expand_less,
      'expand_more': (visitor) => Icons.expand_more,
      'more_vert': (visitor) => Icons.more_vert,
      'more_horiz': (visitor) => Icons.more_horiz,

      // Action icons
      'edit': (visitor) => Icons.edit,
      'delete': (visitor) => Icons.delete,
      'save': (visitor) => Icons.save,
      'search': (visitor) => Icons.search,
      'settings': (visitor) => Icons.settings,
      'favorite': (visitor) => Icons.favorite,
      'favorite_border': (visitor) => Icons.favorite_border,
      'share': (visitor) => Icons.share,
      'refresh': (visitor) => Icons.refresh,
      'check': (visitor) => Icons.check,
      'clear': (visitor) => Icons.clear,
      'done': (visitor) => Icons.done,
      'cancel': (visitor) => Icons.cancel,
      'info': (visitor) => Icons.info,
      'warning': (visitor) => Icons.warning,
      'error': (visitor) => Icons.error,

      // Communication icons
      'email': (visitor) => Icons.email,
      'phone': (visitor) => Icons.phone,
      'chat': (visitor) => Icons.chat,
      'message': (visitor) => Icons.message,
      'send': (visitor) => Icons.send,

      // Media icons
      'play_arrow': (visitor) => Icons.play_arrow,
      'pause': (visitor) => Icons.pause,
      'stop': (visitor) => Icons.stop,
      'skip_next': (visitor) => Icons.skip_next,
      'skip_previous': (visitor) => Icons.skip_previous,
      'volume_up': (visitor) => Icons.volume_up,
      'volume_down': (visitor) => Icons.volume_down,
      'volume_off': (visitor) => Icons.volume_off,
      'volume_mute': (visitor) => Icons.volume_mute,
      'folder': (visitor) => Icons.folder,
      'arrow_forward_ios': (visitor) => Icons.arrow_forward_ios,
      'task_alt': (visitor) => Icons.task_alt,
      'trending_up': (visitor) => Icons.trending_up,
      'folder_open': (visitor) => Icons.folder_open,
      'insert_drive_file': (visitor) => Icons.insert_drive_file,
      'attach_file': (visitor) => Icons.attach_file,
      'download': (visitor) => Icons.download,
      'upload': (visitor) => Icons.upload,
      'cloud': (visitor) => Icons.cloud,
      'cloud_download': (visitor) => Icons.cloud_download,
      'cloud_upload': (visitor) => Icons.cloud_upload,

      // Person icons
      'person': (visitor) => Icons.person,
      'person_add': (visitor) => Icons.person_add,
      'person_remove': (visitor) => Icons.person_remove,
      'flash_on': (visitor) => Icons.flash_on,
      'group': (visitor) => Icons.group,
      'account_circle': (visitor) => Icons.account_circle,
      'account_box': (visitor) => Icons.account_box,

      // Time icons
      'access_time': (visitor) => Icons.access_time,
      'schedule': (visitor) => Icons.schedule,
      'today': (visitor) => Icons.today,
      'date_range': (visitor) => Icons.date_range,
      'event': (visitor) => Icons.event,
      'list': (visitor) => Icons.list,

      // Image icons
      'image': (visitor) => Icons.image,
      'photo': (visitor) => Icons.photo,
      'photo_camera': (visitor) => Icons.photo_camera,
      'camera_alt': (visitor) => Icons.camera_alt,
      'videocam': (visitor) => Icons.videocam,

      // Shopping icons
      'shopping_cart': (visitor) => Icons.shopping_cart,
      'palette': (visitor) => Icons.palette,
      'shopping_bag': (visitor) => Icons.shopping_bag,
      'add_shopping_cart': (visitor) => Icons.add_shopping_cart,
      'remove_shopping_cart': (visitor) => Icons.remove_shopping_cart,

      // Rating icons
      'star': (visitor) => Icons.star,
      'star_border': (visitor) => Icons.star_border,
      'star_half': (visitor) => Icons.star_half,
      'thumb_up': (visitor) => Icons.thumb_up,
      'thumb_down': (visitor) => Icons.thumb_down,
      'analytics': (visitor) => Icons.analytics,
      'brightness_6': (visitor) => Icons.brightness_6,
      'color_lens': (visitor) => Icons.color_lens,

      // Visibility icons
      'visibility': (visitor) => Icons.visibility,
      'visibility_off': (visitor) => Icons.visibility_off,

      // Lock icons
      'lock': (visitor) => Icons.lock,
      'lock_open': (visitor) => Icons.lock_open,
      'security': (visitor) => Icons.security,

      // Notification icons
      'notifications': (visitor) => Icons.notifications,
      'notifications_off': (visitor) => Icons.notifications_off,
      'notifications_active': (visitor) => Icons.notifications_active,
      'notifications_none': (visitor) => Icons.notifications_none,
      'help': (visitor) => Icons.help,
      'logout': (visitor) => Icons.logout,
    },
  );
}
