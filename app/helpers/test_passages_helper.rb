module TestPassagesHelper

  def result_header
    if @test_passage.result >= 85
      'Тест успешно пройден'
    else
      'Тест провален'
    end
  end

  def result_class
    if @test_passage.result >= 85
      'success'
    else
      'fail'
    end
  end
  
end
