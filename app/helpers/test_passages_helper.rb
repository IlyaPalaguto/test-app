module TestPassagesHelper

  def result_header
    if @test_passage.passed?
      'Тест успешно пройден'
    else
      'Тест провален'
    end
  end

  def result_class
    if @test_passage.passed?
      'success'
    else
      'fail'
    end
  end
  
end
