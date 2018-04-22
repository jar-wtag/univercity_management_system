module SectionsHelper
  def sections_list
    a = Section.all.map {|sec| [sec.id, sec.section_no]}
    Hash[a]
  end
end
