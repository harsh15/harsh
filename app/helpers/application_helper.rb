module ApplicationHelper

  def resp_image_tag(photo, device_size_map, options={})
    if photo.file.present?
      options[:alt] = options[:alt] || photo.try(:caption)
    end
    width, height = device_size_map[best_size_for_device(device_size_map)].split('x')
    options.merge!({height: height, width: width})
    cl_image_tag(photo, options)
  end

private

  def best_size(available_sizes, sizes_by_preference)
    sizes_by_preference.each do |sz|
      return sz if available_sizes[sz].present?
    end
  end

  def sizes_by_preference
    if(browser.mobile?)
      [:xs, :sm, :md, :lg]
    elsif(browser.tablet?)
      [:sm, :md, :lg, :xs]
    else
      [:lg, :md, :sm, :xs]
    end
  end

  def best_size_for_device(available_sizes)
    best_size(available_sizes, sizes_by_preference)
  end

end
