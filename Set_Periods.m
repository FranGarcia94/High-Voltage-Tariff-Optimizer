%- Establecer Periodos (discrimina Fines de Semana)
periodo=zeros(size(t2,1),1);

i=1;
while(i<=size(t2,1))  
    switch t2.Fecha(i).Month
        case {1,2,7,12}
            switch t2.Horas(i)
                case {0,1,2,3,4,5,6,7,24} % Siempre igual
                    periodo(i)=6;
                case {8,14,15,16,17,22,23}
                    periodo(i)=2;
                case {9,10,11,12,13,18,19,20,21}
                    periodo(i)=1;
            end
        case {3,11}
            switch t2.Horas(i)
                case {0,1,2,3,4,5,6,7,24} % Siempre igual
                    periodo(i)=6;
                case {8,14,15,16,17,22,23}
                    periodo(i)=3;
                case {9,10,11,12,13,18,19,20,21}
                    periodo(i)=2;
            end
        case {4,5,10}
            switch t2.Horas(i)
                case {0,1,2,3,4,5,6,7,24} % Siempre igual
                    periodo(i)=6;
                case {8,14,15,16,17,22,23}
                    periodo(i)=5;
                case {9,10,11,12,13,18,19,20,21}
                    periodo(i)=4;
            end
        case {6,8,9}
            switch t2.Horas(i)
                case {0,1,2,3,4,5,6,7,24} % Siempre igual
                    periodo(i)=6;
                case {8,14,15,16,17,22,23}
                    periodo(i)=4;
                case {9,10,11,12,13,18,19,20,21}
                    periodo(i)=3;
            end
    end
    if (isweekend(t2.Fecha(i))==1)
        periodo(i)=6;
    end

    i=i+1;
end
