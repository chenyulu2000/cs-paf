import torch.nn as nn


class EncoderDecoderModel(nn.Module):
    """
    convenience wrapper module, wrapping encoder and decoder modules
    """

    def __init__(self, encoder, decoder):
        super(EncoderDecoderModel, self).__init__()
        self.encoder = encoder
        self.decoder = decoder

    def forward(self, batch, is_cfg=False, is_cfic=False):
        encoder_output = self.encoder(batch, is_cfg, is_cfic)
        decoder_output = self.decoder(encoder_output, batch)
        return decoder_output
