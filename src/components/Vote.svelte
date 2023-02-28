<script>
    export let title;
    export let img_url;
</script>

<div class="vote-card" style="background-image: url({img_url});">
    <div class="card-gradient">
        <h2>
            {title}
        </h2>
        <button class="vote-button">
            <h2>Vote</h2>
        </button>
    </div>
</div>

<style>
    h2 {
        margin: 0;
        font-family: Staatliches, sans-serif;
        color: white;
        transition: color 1s cubic-bezier(0.22, 1, 0.36, 1);
    }
    .vote-card {
        display: flex;
        aspect-ratio: 1 / 1.25;
        background-color: white;
        background-size: 400%;
        border-radius: 0.6rem;
        background-size: cover;
        transition: 0.5s;
        box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1),
            0 2px 4px -2px rgba(0, 0, 0, 0.1);
    }
    .vote-card:is(:hover) {
        background-position: bottom;
    }
    .vote-card:is(:hover) .card-gradient {
        background: #00000099;
    }
    .vote-card:is(:hover) .vote-button {
        display: block;
    }
    .card-gradient {
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        width: 100%;
        line-height: 1.4;
        padding: 0.5rem 1rem;
        border: 0;
        border-radius: inherit;
        background: linear-gradient(180deg, #000000cc 10%, #ffffff00 50%);
    }
    .vote-button {
        display: none;
        background-color: #ffffff00;
        border: 1px solid white;
    }
    .vote-button:is(:hover) {
        background-color: rgba(255, 255, 255, 0.3);
    }
</style>
