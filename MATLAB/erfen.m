function [x,i]=erfen(a,b,e)
for i=1:1000
    x=a+(b-a)/2;                 %a��b�м��ֵ
    if (fc(x)==0|(b-a)/2<e)   %�ж��Ƿ���Ϊ�����Ѵﵽ�������Χ
        x ;                              %���Ƹ�
        i ;                               %��������
        break;
    else
        if (fc(a)*fc(x)>0)
            a=x;                      %�⼸��������С�����ڵ�����
        else
            b=x;
        end
    end
end
