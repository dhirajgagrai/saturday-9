<script>
    export let title;
    export let img_url;
</script>

<div class="vote-card" style="background-image: url({img_url});">
    <button>
        <h2>
            {title}
        </h2>
    </button>
</div>

<style>
    .vote-card {
        display: flex;
        aspect-ratio: 1 / 1.25;
        background-color: white;
        background-size: 400%;
        border-radius: 0.6rem;
        background-size: cover;
        transition: background-position 1s cubic-bezier(0.22, 1, 0.36, 1);
        box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1),
            0 2px 4px -2px rgba(0, 0, 0, 0.1);
    }
    .vote-card > button {
        display: flex;
        width: 100%;
        line-height: 1.4;
        padding: 0.5rem 1rem;
        border: 0;
        border-radius: inherit;
        color: white;
        background: linear-gradient(180deg, #000000c1 10%, #ffffff00 50%);
    }
    h2 {
        margin: 0;
        font-family: Staatliches, sans-serif;
        transition: color 0.6s cubic-bezier(0.22, 1, 0.36, 1);
    }
    .vote-card:is(:hover) {
        background-position: bottom;
    }
</style>
