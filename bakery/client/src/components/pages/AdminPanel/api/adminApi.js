import host from ".";

const getProfile = async () => {
    try {
        const response = await host.get("/api/admin");

        return response;
    } catch (error) {
        if (error.response) {
            return error.response;
        } else if (error.request) {
            console.log("Server did not respond.");
        } else {
            console.log("Error while creating request");
        }
    }
};


export { getProfile };