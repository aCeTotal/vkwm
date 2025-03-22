use wayland_server::Display;

pub struct CompositorState;

pub struct VkCompServer {
    display: Display<CompositorState>,
}

impl VkCompServer {
    pub fn new() -> Self {
        VkCompServer {
            display: Display::new().unwrap(),
        }
    }
}

