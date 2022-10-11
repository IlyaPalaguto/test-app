module TestPassagesHelper

  def result_header
    if @test_passage.passed?
      t('.success', test: @test_passage.test.title)
    else
      t('.failed', test: @test_passage.test.title)
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
