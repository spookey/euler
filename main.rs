use std::env;

fn factorial(n: i32) -> f64 {
    let mut res: f64 = 1.;
    for i in 1..(n+1) {
        res *= i as f64;
    }
    res
}

fn calc(n: i32) -> f64 {
    let mut res: f64 = 0.;
    for i in 0..(n+1) {
        res += (1./factorial(i)) as f64;
    }
    res
}

fn main() {
    let mut limit: i32 = 100;

    if let Some(first) = env::args().nth(1) {
        match first.parse::<i32>()
            .map_err(|err| err.to_string()) {
                Ok(l) => limit=l,
                Err(err) => println!("error: {}", err),
        }
    }

    println!("{:.16}", calc(limit));
}
