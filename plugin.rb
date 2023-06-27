# app/plugins/slider_plugin.rb

class SliderPlugin < DiscoursePlugin
  def self.register_plugin_settings
    Setting.new(:slider_images, default: [], type: :array)
    Setting.new(:slider_links, default: [], type: :array)
    Setting.new(:slider_width, default: 100, type: :integer)
  end

  def self.registered_names
    [:slider_plugin]
  end

  def after_initialize
    mount_at = '/slider'
    admin_mount_at = '/admin/slider'
    add_to_routes(mount_at, admin_mount_at)
  end

  def mount_pages
    [
      mount_at,
      admin_mount_at,
    ]
  end

  def admin_index_action
    render_admin_template('index')
  end

  def slider_action
    render_template('slider')
  end

  private

  def render_template(template)
    render_template_file(File.join('app/plugins/slider_plugin', template))
  end
end