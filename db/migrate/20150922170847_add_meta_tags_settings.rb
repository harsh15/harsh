class AddMetaTagsSettings < ActiveRecord::Migration
  SETTINGS = {
    "title" => "Harshvardhan Parihar is a Film Maker.",
    "title.blogs.index" => "HarshvardhanParihar.com Blogs.",
    "title.blogs.show" => "\#{model.title}",

    "meta.description" => "HarshvardhanParihar.com - Harshvardhan Parihar is a Film Maker, Screen Writer and Film Editor.",
    "meta.description.blogs.index" => "HarshvardhanParihar.com blogs. Harshvardhan Parihar is a Film Maker, Screen Writer and Film Editor..",
    "meta.description.blogs.show" => "\#{model.short_description}",

    "og.type" => "website",
    "og.description" => "HarshvardhanParihar.com - Harshvardhan Parihar is a Film Maker, Screen Writer and Film Editor.",
    "og.title.blogs.show" => "\#{model.title}",
    "og.description.blogs.show" => "\#{model.short_description}",
    "og.image.blogs.show" => "\#{model.try(:cover_photo).try(:photo).try(:url)}",
    "og.url" => "\#{request.url}",

    "twitter.card" => "summary",
    "twitter.title.blogs.index" => "HarshvardhanParihar.com blogs. Harshvardhan Parihar is a Film Maker, Screen Writer and Film Editor.",
    "twitter.title.blogs.show" => "\#{model.title}",
    "twitter.description.blogs.index" => "HarshvardhanParihar.com blogs. Harshvardhan Parihar is a Film Maker, Screen Writer and Film Editor.",
    "twitter.description.blogs.show" => "\#{model.short_description}",
    "twitter.image.blogs.index" => "",
  }

  def up
    SETTINGS.each do |k, v|
      Setting[k] = v
    end
  end

  def down
    SETTINGS.each do |k, v|
      Setting.destroy(k)
    end
  end
end
