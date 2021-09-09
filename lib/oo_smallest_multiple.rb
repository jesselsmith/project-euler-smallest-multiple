# Implement your object-oriented solution here!
class SmallestMultiple
    def initialize(divisorMax)
      @divisorMax = divisorMax
    end

    def lcm()
        factorArray = collectPrimeFactors()
    
        primeFactorObject = combinePrimeFactors(factorArray)
    
        total = 1
    
        primeFactorObject.each do |key, value|
            total *= key.to_i ** value
        end
        total
    end
    
    def primeFactors(number)
        factors = {}
    
        while number % 2 == 0
            if factors[2].nil? 
                factors[2] = 1
            else
                factors[2] += 1
            end
            number /= 2
        end
    
        i = 3
    
        while i <= Math.sqrt(number)
            while number % i == 0
                if factors[i].nil? 
                    factors[i] = 1
                else
                    factors[i] += 1
                end
                number /= i
            end
    
            i +=  2
        end
    
        if( number > 2)
            factors[number] = 1
        end
    
        factors
    end
    
    def collectPrimeFactors()
        (2..@divisorMax).collect do |number| 
            primeFactors(number)
        end
    end
    
    
    def combinePrimeFactors(arrayOfPrimeFactors)
        combinedPrimeFactors = {}
    
        arrayOfPrimeFactors.each do |factors|
            factors.each do |key, value|
                if combinedPrimeFactors[key].nil? || value > combinedPrimeFactors[key]
                    combinedPrimeFactors[key] = value
                end
            end
        end
    
        combinedPrimeFactors
    end
end