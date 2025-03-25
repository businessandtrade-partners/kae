class Assessor::CommercialFiguresFilesController < Assessor::BaseController
  include AdminShortlistedDocsContext

  def build_resource
    begin_of_association_chain.build_commercial_figures_file(permitted_params)
  end

  def relationship_name
    :commercial_figures_file
  end

  def resource_class
    CommercialFiguresFile
  end
end
