%% Optimizador Tarifas Alta Tensión
%
tic
%%
pc_potencia=[30.535795 25.894705 14.909149 12.094449 3.93866 2.108693]; % Peajes + Cargos (Potencia) €/kW

N=300;
coste_anual=zeros(1,N);
precio_potencia_total=zeros(1,N);
exceso_anual=zeros(1,N);

vec_excesos=zeros(6,N);
vec_precio=zeros(6,N);
vec_coste=zeros(6,N);

op=2800;
pot_contratada=[op op op op op op]; % Se ha supuesto una potencia

k=1;
while (k<=N)
     
    precio_potencia=pot_contratada.*pc_potencia;
    
    
    %% Cálculo del término dentro de la raiz de la fórmula de excesos de potencia
    matriz_0=zeros(6,12);

    i=1;
    while(i<=size(t2,1))
        if (t2.Potencia(i)>pot_contratada(periodo(i)))

            d=(t2.Potencia(i)-pot_contratada(periodo(i)))^2;

            matriz_0(periodo(i),t2.Fecha(i).Month)=matriz_0(periodo(i),t2.Fecha(i).Month)+d;
        end
        i=i+1;
    end

    %% Cálculo del Factor de exceso de Potencia €
    Aei=sqrt(matriz_0);
    kp=[1 1 0.5427 0.4103 0.0264 0.0264];
    tep=1.406400;
    Fep=zeros(6,12);

    for i=1:6
        for j=1:12
            Fep(i,j)=Aei(i,j)*tep*kp(i);
        end
    end

    exceso_mensual=zeros(1,12);
    for i=1:12
        exceso_mensual(i)=sum(Fep(:,i));
    end

    exceso_anual(k)=sum(exceso_mensual);

    exceso_periodos=zeros(1,6);
    for i=1:6
        exceso_periodos(i)=sum(Fep(i,:));
    end
    

    %%
    
    precio_potencia_total(k)=sum(precio_potencia);
    coste_anual(k)=exceso_anual(k)+precio_potencia_total(k);
    
    fprintf("%d Coste Anual: %.2f [€]\n",k,coste_anual(k))
    
    for i=1:6
        vec_precio(i,k)=pot_contratada(i)*pc_potencia(i);
        vec_excesos(i,k)=exceso_periodos(i);
        vec_coste(i,k)=vec_excesos(i,k)+vec_precio(i,k);
    end

    if k>1
        R=randi(70);
        if coste_anual(k)<coste_anual(k-1)
            if vec_coste(1,k)<vec_coste(1,k-1)
                pot_contratada=pot_contratada+R;
            elseif vec_coste(2,k)<vec_coste(2,k-1)
                pot_contratada(1,2:end)=pot_contratada(1,2:end)+R;
            elseif vec_coste(3,k)<vec_coste(3,k-1)
                pot_contratada(1,3:end)=pot_contratada(1,3:end)+R;
            elseif vec_coste(4,k)<vec_coste(4,k-1)
                pot_contratada(1,4:end)=pot_contratada(1,4:end)+R;
            elseif vec_coste(5,k)<vec_coste(5,k-1)
                pot_contratada(1,5:end)=pot_contratada(1,5:end)+R;
            elseif vec_coste(6,k)<vec_coste(6,k-1)
                pot_contratada(6)=pot_contratada(6)+R;
            end
        else
            pot_contratada=optima-R;
        end
    else
        pot_contratada=pot_contratada+50;
    end
    % Habría que poner la restrición de las potencias, aunque en este caso
    % no influya
    if coste_anual(k)==min(coste_anual(1:k))
        optima=pot_contratada;
    end
    
    k=k+1;
end
toc
