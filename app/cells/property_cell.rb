class PropertyCell < Cell::Rails

  def company_categories
    @properties = Crm::Company::Category.all

    render
  end

  def contact_categories
    @properties = Crm::Contact::Category.all

    render
  end

  def phone_klasses
    @properties = Crm::Phone::Klass.all

    render
  end

  def deal_categories
    @properties = Crm::Deal::Category.all

    render
  end

  def deal_statuses
    @properties = Crm::Deal::Status.all

    render
  end

  def activity_categories
    @properties = Crm::Activity::Category.all

    render
  end

  def activity_statuses
    @properties = Crm::Activity::Status.all

    render
  end

  def contract_statuses
    @properties = Cm::Contract::Status.all

    render
  end

  def contact_statuses
    @properties = Crm::Contact::Status.all

    render
  end

end
