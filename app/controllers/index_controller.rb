class IndexController < ApplicationController
  def input
  end

  def calc
    @mas=func(params[:value])
    respond_to do |format|  
      format.html  
      format.json do #метод json объекта format 
       render json: {type: @mas.class.to_s, value: @mas} 
      end 
      format.any do  
       render plain: 'Неправильный формат' 
      end  
     end
  end

private
  def func(input_line)
   puts ">>>>>>>>>>>>#{input_line}"
    if input_line.nil?
      'Некорректный ввод' 
    elsif input_line.scan(/\D/).any? || input_line.empty?  
      'Некорректный ввод'
    elsif input_line.to_f<0
      'Некорректный ввод'
    else
      a = input_line.to_f
      x=a
      array=[]
      array.push(x)
       while ((x**2-a)/a)>=0.001 
         x1=(1/2.0)*(x+(a/x)) 
         x=x1.round(3)
         array.push(x)
       end
      array
     end
   end
  
end