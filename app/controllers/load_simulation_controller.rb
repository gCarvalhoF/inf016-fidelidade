class LoadSimulationController < ApplicationController
  def simulate
    # Run a CPU-intensive task in a background thread
    Thread.new do
      perform_cpu_intensive_task
    end

    render json: { message: 'Load simulation started' }, status: :ok
  end

  private

  def perform_cpu_intensive_task
    # Simulate CPU load by performing a large number of calculations
    10.times do
      fibonacci(35) # A function that uses a lot of CPU
    end
  end

  def fibonacci(n)
    return n if n <= 1
    fibonacci(n - 1) + fibonacci(n - 2)
  end
end
