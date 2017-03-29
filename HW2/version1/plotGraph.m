% P = chromosome(chromosomeProperties.populationNumber+1).gene(1).value;
% I = chromosome(chromosomeProperties.populationNumber+1).gene(2).value;
% D = chromosome(chromosomeProperties.populationNumber+1).gene(3).value;
P = SAEP; I = SAEI; D = SAED;
figure(24);
sim('motor1');
response01 = response1;
plot(response01.time, response01.signals.values, 'b');
grid on;
hold on;

        P = 792.12;
        I = 18638;
        D = 8.42;
        sim('motor1');
        plot(response1.time, response1.signals.values, 'r');
        
P = SSEP; I = SSEI; D = SSED;
sim('motor1');
plot(response1.time, response1.signals.values, 'g');