mod compositor;
mod renderer;
mod wm;

use compositor::server::VkCompServer;

fn main() {
    env_logger::init();
    println!("Starter VMWM Wayland-kompositor...");

    // Start Wayland-server
    let _server = VkCompServer::new();
}

