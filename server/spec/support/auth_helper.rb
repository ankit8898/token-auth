module AuthHelper

  def login_professor
    before do
      allow(controller).to receive(:authenticate_professor!).and_return(true)
    end
  end

  def login_student
    before do
      allow(controller).to receive(:authenticate_student!).and_return(true)
    end
  end


  def login_author
    before do
      allow(controller).to receive(:authenticate_author!).and_return(true)
    end
  end
end
